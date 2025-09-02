const assert = chai.assert;
const expect = chai.expect;

describe("DinnerModel", function testDinnerModelCB() {
    function removeComments(m){ return m.toString().replace(/\/\*[\s\S]*?\*\/|\/\/.*/g, ""); }
    const assignment= /[_$a-zA-Z\xA0-\uFFFF][_\.$a-zA-Z0-9\xA0-\uFFFF]*\s*=[^=><]/g;
    const plusEqual= /[_$a-zA-Z\xA0-\uFFFF][_\.$a-zA-Z0-9\xA0-\uFFFF]*\s*[\+\-\*\/\%]=/g;
    const CBWarning= "Do not use anonymous or arrow functions. Use a function name that describes what the function does. If the function is passed as callback, please use a CB suffix";
    
    function noDishSource(m){
        expect(/DishSource/g.test(removeComments(m)), 
               m.name + " does not need to use DishSource, it only operates with the DinnerModel dishes").to.equal(false);
    }

    function noArraySpread(text, name){
        expect(/\[\s*\.\.\./g.test(text), 
               name + " does not need to use array spread. Arrays don't need to be cloned if you use filter(), map() or reduce() because they do not modify the original arrray, but create a new one. That is, they are is immutable methods. sort(), push(), splice() are mutable.").to.equal(false);
    }

    function noAssignment(m, one=false){
        it(m.name+" functional: "+(one?"a single assignment, to this.dishes":"no assignments "), function noAssignmentTestCB(){
            const text= removeComments(m);
            
            const matches= [...text.matchAll(assignment)];
            if(one){
                expect(matches.length, "may only assign this.dishes, once. It uses assignments: "+matches).to.equal(1);
                expect(matches[0][0], "may only assign this.dishes, once").to.be.a('string');
                expect(/^this.dishes\s*=/g.test(matches[0][0]), "may only assign this.dishes, once").to.equal(true);
            }else{
                expect(matches.length, "may not use assignments. It uses "+matches).to.equal(0);
            }
            const matches1= [...text.matchAll(plusEqual)];
            expect(matches1.length, "may not use +=, -=, /=, %= assignments. It uses "+matches1).to.equal(0);

            expect(/Object\s*\.\s*assign\s*\(/g.test(text), "functional code may not use Object.assign, as it performs a mutation (assignment)").to.equal(false);
        }
          );
       
    }
    
    function testFunctional(method, noASpread){
        it(method.name+" functional: no procedural statements or mutable methods", function testFunctionalTestCB(){
            const text= removeComments(method);
            
            expect(/(var\s+|let\s+|for\s*\(|while\s*\(|if\s*\(|push\s*\(|splice\s*\(|unshift\s*\(|pop\s*\(|shift\s*\()/g
                   .test(text),
                   `
Implementation should be functional and therefore not include statements like: 
'let', 'var', 'for', 'while', 'if' 
or mutable array methods like: 
'push', 'pop', 'unshift', 'shift', 'splice'

`).to.equal(false);
              
            expect(/=>/g.test(text), CBWarning).to.equal(false);
            expect(/function\s*\(/g.test(text), CBWarning).to.equal(false);

            if(noASpread)
                noArraySpread(text, method.name);
            
        });
    }
        
    this.timeout(200000);  // increase to allow debugging during the test run
    let model = new DinnerModel();
    
    beforeEach(function beforeEachTestCB() {
        model = new DinnerModel();
    });

    describe("W1 number of guests (functions, if(), throw exercise)", function constructorSuiteCB() {
/*        it("number of guests and dishes are the ones indicated as constructor parameters", function constructortCB() {
            model= new DinnerModel(3, [dishesConst[0], dishesConst[4]]);
            expect(model.guests).to.equal(3, "number of guests should be the one indicated as constructor parameter");
            const sameDishes= "dish array should contain the same elements as the one indicated as constructor parameter";
            expect(model.dishes.length).to.equal(2, sameDishes);
            expect(model.dishes[0]).to.equal(dishesConst[0], sameDishes);
            expect(model.dishes[1]).to.equal(dishesConst[4], sameDishes);
        });*/
        it("default number of guests is 2", function numberOfGuestsDefaultNumberCB() {
            expect(model.guests, "a DinnerModel number of guests should be set to 2").to.equal(2); /* when no parameter is sent to the constructor*/
        });

        it("can set and get number of guests", function getSetNumberOfGuestsCB() {
            model.setNumberOfGuests(1);
            expect(model.guests, "number of guests should have the value passed to setNumberOfGuests").to.equal(1, "after setting number of guests, the model guests should be the indicated value");
            
            model.setNumberOfGuests(3);
            expect(model.guests, "number of guests should have the value passed to setNumberOfGuests").to.equal(3, "after setting number of guests, the model guests should be the indicated value");
        });

        it("number of guests is a positive integer", function numberOfGuestsPositiveIntegerTestCB() {
            const msg= "number of guests not a positive integer";
            
            expect(function testThrowNegativeCB(){model.setNumberOfGuests(-1);}, "when a negative number is passed, setNumberOfGuests should throw").to.throw(msg);
            expect(function testThrowZeroCB(){model.setNumberOfGuests(0); }, "when zero is passed, setNumberOfGuests should throw").to.throw(msg);
            expect(function testThrowRealCB(){model.setNumberOfGuests(3.14159265);}, "when a non-integer is passed, setNumberOfGuests should throw").to.throw(msg);
        });
    });
    
    const dishPresent= "a dish that was added to the menu must be present in the model dishes array";
    describe("W1 menu (array exercises)", function menuSuiteCB() {
        it("default (initial) dishes is an empty array", function numberOfGuestsDefaultDishesCB() {
            expect(model.dishes, "a DinnerModel dishes should be set to empty array by the constructor").to.be.an("Array");
            expect(model.dishes.length, "a DinnerModel dishes should be set to empty array").to.equal(0);   /* when no second parameter is sent to the constructor*/
        });
                   

        it("can add dishes (adding elements to arrays)", function canAddDishesTestCB() {
            noDishSource(model.addToMenu);
            model.addToMenu(dishesConst[0]);
            expect(model.dishes).to.include(dishesConst[0], dishPresent);
            expect(model.dishes.length).to.equal(1, "after one dish was added, the model dishes array must have length 1");
            
            model.addToMenu(DishSource.getDishDetails(100));
            expect(model.dishes).to.include(dishesConst[0], dishPresent);
            expect(model.dishes).to.include(dishesConst[4], dishPresent);
            expect(model.dishes.length).to.equal(2, "after two dishes were added, the model dishes array must have length 2");
        });
        
        it("can remove dishes (filter() exercise)", function removeDishTestCB() {
            noDishSource(model.removeFromMenu);
            model.dishes= [dishesConst[0], dishesConst[4], dishesConst[8]];
            
            model.removeFromMenu({id:1});
            // should now be removed
            expect(model.dishes).to.not.include(dishesConst[0], "after a dish with a given ID was removed, no dish with that ID should be found in the dishes array");

            const dishStill= "after a dish removal, the dishes that do not have that ID must be still in the menu";
            expect(model.dishes.length).to.equal(2, "after a dish removal from menu, the dishes array should decrease in length with 1 if a dish with that ID  was indeed part of the menu");
            expect(model.dishes).to.include(dishesConst[4], dishStill);
            expect(model.dishes).to.include(dishesConst[8], dishStill);

            // remove non-existing dish
            model.removeFromMenu({id:256});
            expect(model.dishes.length).to.equal(2, "after attempting to remove a dish whose ID is not present in the menu, the dishes length should stay unchanged");
            expect(model.dishes).to.include(dishesConst[4], dishStill);
            expect(model.dishes).to.include(dishesConst[8], dishStill);
        });

        it("dish of type (filter() and undefined exercise)", function dishOfTypeTestCB() {
            noDishSource(model.getDishOfType);
            const dishType=  "getDishOfType should return the dish from the menu with the indicated type";
            model.dishes= [dishesConst[1], dishesConst[4], dishesConst[8]];
            expect(model.getDishOfType("starter")).to.equal(dishesConst[1], dishType);
            expect(model.getDishOfType("main course")).to.equal(dishesConst[4], dishType);
            expect(model.getDishOfType("dessert")).to.equal(dishesConst[8], dishType);

            model.dishes= [dishesConst[1], dishesConst[4]];
            expect(model.getDishOfType("dessert")).to.equal(undefined, "if no dish of the given type exists in the menu, getDishOfType must return undefined");
        });

        it("overwrites dishes of the same type when adding (combine filter() with adding elements to arrays)", function dishOfSameTypeTestCB() {
            model.dishes= [dishesConst[8], dishesConst[0], dishesConst[4]];
            model.addToMenu(dishesConst[1]);
            // the old starter dish should no longer exist
            expect(model.dishes).to.not.include(dishesConst[0], "if a dish with the same type is added, the existing dish with that type must be removed from the menu");
            expect(model.dishes.length).to.equal(3, "after a dish with an existing type is added, the length of the dishes array must remain the same as before");
            // the new dish should exist
            expect(model.dishes).to.include(dishesConst[1], "after a dish with an existing type is added, it must be in the menu");
            expect(model.dishes).to.include(dishesConst[4], "after a dish with an existing type is added, dishes with a different type must remain in the menu");
            expect(model.dishes).to.include(dishesConst[8], "after a dish with an existing type is added, dishes with a different type must remain in the menu");

        });
        


    });

    describe("W1 getting individual dishes in DishSource.getDishDetails (filter() and undefined exercise)", function getIndividualDishesSuiteCB() {
        it("gets the correct dish", function getDishTestCB() {
            const dish1 = DishSource.getDishDetails(1);
            expect(dish1.id).to.equal(1, "the ID of the returned dish mustt be the number passed to getDishDetails()");
            expect(dish1).to.equal(dishesConst[0], "the returned dish must have the dish from dishesConst that has the respective ID");
            
            const dish100 = DishSource.getDishDetails(100);
            expect(dish100.id).to.equal(100, "the ID of the returned dish mustt be the number passed to getDishDetails()");
            expect(dish100).to.equal(dishesConst[4], "the returned dish must have the dish from dishesConst that has the respective ID");
        });
        
        it("returns undefined if dish is not found", function dishNotFoundTestCB() {
            const result1 = DishSource.getDishDetails(-1);
            expect(result1).to.equal(undefined, "if the dish with the indicated ID does not exist in dishesConst, undefined must be returned");
            
            const result2 = DishSource.getDishDetails();
            expect(result2).to.equal(undefined, "if the dish with the indicated ID does not exist in dishesConst, undefined must be returned");
        });
    });

    describe("W1: searching dishes in dishesConst (filter() and conditional exercises)", function w2SearchDishesSuiteCB() {
        it("returns all dishes if no search criteria are specified", function allDishesReturnedIfNoSearchCriteriaCB() {
            const allDishes = DishSource.searchDishes({});
            expect(allDishes.length).to.equal(11, "all dishes must be returned if no search parameters are specified");
            expect(allDishes).to.include.deep.members(dishesConst, "all dishes must be returned if no search parameters are specified");
        });
        
        it("returns the correct dish type", function correctDishOfTypeTestCB() {
            let dishes = DishSource.searchDishes({type:"starter"});
            let expected =[dishesConst[0], dishesConst[1], dishesConst[2]];
            const allType= "all dishes with a certain type must be returned";
            expect(dishes).to.include.deep.members(expected, allType);
            expect(dishes.length).to.equal(expected.length,  allType);
           
            dishes = DishSource.searchDishes({type: "main course"});
            expected= [dishesConst[4], dishesConst[5], dishesConst[6], dishesConst[7]];
            expect(dishes).to.include.deep.members(expected, allType);
            expect(dishes.length).to.equal(expected.length,  allType);
        });
        
        it("filter by dish name", function filterWithKeywordsTestCB() {
            let dishes = DishSource.searchDishes({query:"French"});
            const allQuery="if a dish name includes the given query, it must be present in the results";
            expect(dishes.length).to.equal(1, allQuery);
            expect(dishes[0]).to.equal(dishesConst[0]);

            dishes = DishSource.searchDishes({query:"Meat"});
            expect(dishes.length).to.equal(1, allQuery);
            expect(dishes[0]).to.equal(dishesConst[4]);

            dishes = DishSource.searchDishes({query:"Ice cream"});
            expect(dishes.length).to.equal(2, allQuery);
            expect(dishes).to.include.deep.members([dishesConst[8], dishesConst[9]], allQuery);
        });
        
        it("returns correct dishes with given name and type", function correctDishesWithFilterAndTypeCB() {
            let dishes = DishSource.searchDishes({type:"starter", query:"Sour"});
            expect(dishes.length).to.equal(1, "when both type and name are specified, only the dishes that fulfill those condition should be returned");
            expect(dishes[0]).to.equal(dishesConst[1]);
            dishes = DishSource.searchDishes({type:"dessert", query:"Ice cream"});
            expect(dishes.length).to.equal(2, "when both type and name are specified, only the dishes that fulfill those condition should be returned");
            expect(dishes).to.include.deep.members([dishesConst[8], dishesConst[9]]);

            dishes = DishSource.searchDishes({type: "main course", query:""});
            let expected= [dishesConst[4], dishesConst[5], dishesConst[6], dishesConst[7]];
            expect(dishes.length).to.equal(expected.length,  "empty name string will be considered unspecified");
            expect(dishes).to.include.deep.members(expected, "empty name string will be considered unspecified");


            dishes = DishSource.searchDishes({query:"Ice cream", type:""});
            expect(dishes.length).to.equal(2, "empty type string will be considered unspecified");
            expect(dishes).to.include.deep.members([dishesConst[8], dishesConst[9]],  "empty type string will be considered unspecified");
        });

        it("returns an empty array, if no dish with the search criteria is found", function correctDishesWithFilterAndTypeCB() {
            const dishes = DishSource.searchDishes({type:"main course", query:"Sour"});     
            expect(dishes.length).to.equal(0, "there is no Sour main course, so this should return empty array");
        });
        
    });

    describe("W2: make W1 methods functional", function w1MethodsFunctionalSuiteCB() {
        testFunctional(DishSource.getDishDetails, true);
        noAssignment(DishSource.getDishDetails);

        testFunctional(model.addToMenu);
        noAssignment(model.addToMenu, true);

        testFunctional(model.removeFromMenu, true);
        noAssignment(model.removeFromMenu, true);
        
        testFunctional(model.getDishOfType, true);
        noAssignment(model.getDishOfType);
    });

    describe("W2 immutable state", function w2ImmutableStateSuiteCB() {
        it("addToMenu creates new dish array", function immutableAddToMenuTestCB() {
            const old= model.dishes;
            model.addToMenu(dishesConst[4]);
            expect(model.dishes).to.not.equal(old, "when a dish is aded to the menu, a new dishes array should be created rather than appending to the old one. This checks that you have used immutable Array operation(s) for the addition");
        });
        it("removeFromMenu creates new dish array", function imutableRemoveFromMenuTestCB() {
            model.dishes=[dishesConst[8]];
            const x= model.dishes;
            model.removeFromMenu({id:200});
            expect(model.dishes).to.not.equal(x, "when a dish is removed from the menu, a new dishes array should be created rather than appending to the old one. This checks that you have used immutable Array operation(s) for the removal");
        });
        it("getMenu returns a copy, so the caller cannot mutate the model's dish array", function getMenuReturnsCopyTestCB() {
            model.dishes=[dishesConst[8], dishesConst[4]];
            expect(model.getMenu()).to.not.equal(model.dishes, "getMenu must return a different array from the model dishes array");
            expect(model.getMenu()).to.deep.equal([dishesConst[8], dishesConst[4]], "the array returned by getMenu() must have the same elements as the model dishes array");
        });

        /*
        it("The constructor makes a copy of the given array so nobody can inadvertently change the DinnerModel dishes", function constructorCopyTestCB() {
            const x= [dishesConst[4], dishesConst[5]];
            model= new DinnerModel(7, x);
            expect(model.dishes).to.not.equal(x, "the model dishes will not be the same array as the one passed as parameter, but a copy");
            expect(model.dishes).to.deep.equal(x, "the model dishes array will contain the same elements as the passed array");
        });*/
        
    });

    describe("W2 totals (reduce() and functional programming exercises)", function w2TotalsSuiteCB() {
        it("dish price (DishSource.getDishPrice())", function dishPriceTestCB() {
            noDishSource(DishSource.getDishPrice);
            const dishPriceMsg= "price of a dish must be the sum of its ingredient prices multiplied by ingredient amount";
            expect(DishSource.getDishPrice(dishesConst[1])).to.equal(52, dishPriceMsg);
            expect(DishSource.getDishPrice(dishesConst[4])).to.equal(2559.5, dishPriceMsg);
        });
        testFunctional(DishSource.getDishPrice, true);
        noAssignment(DishSource.getDishPrice);
        it("total price (DinnerModel.getDinnerPrice())", function totalPriceTestCB() {
            model.dishes= [dishesConst[4], dishesConst[1]];
            expect(model.getDinnerPrice()).to.equal(2*(52+2559.5), "price of the menu must be the sum of its dish prices, multiplied with the number of guests");
        });
        testFunctional(model.getDinnerPrice, true);
        noAssignment(model.getDinnerPrice);
    });
    
    describe("W2 function chains", function w2FunctionChainCB(){
        it("DishSource.searchDishes should be a function chain like array.filter(checkTypeCB).filter(checkNameCB)", function checkChainCB(){
            const matches= [...removeComments(DishSource.searchDishes).matchAll( /\.filter\s*\(/g)];
            expect(matches.length, "searchDishes should be a function chain like array.filter(CB1).filter(CB2)").to.equal(2);
        });
        testFunctional(DishSource.searchDishes, true);
        noAssignment(DishSource.searchDishes);
    });
    describe("Bonus 1: using objects as dictionaries", function w1getIngedientsCB() {
        
        it("getIngredients", function ingredientsTestCB() {
            noDishSource(model.getIngredients);
            
            model.dishes= [dishesConst[1]];
            const ret1= model.getIngredients();
            
            expect(ret1).to.include.deep.members(dishesConst[1].ingredients, "when only one dish is in the menu, getIngredients will return an array containing opy of each ingredient of that dish");
            expect(ret1.length).to.equal(dishesConst[1].ingredients.length, "when only one dish is in the menu, getIngredients will return an array containing a copy of each ingredient of that dish");
            
            const because= " because quantities will be added up and we don't want to change anything in dishesConst!";
            expect(ret1).to.not.equal(dishesConst[1].ingredients, "the array returned by getIngredients must be different from the ingredients array of any dish "+because);
            
            const differentObject= "the ingredients returned by getIngredients must be different from the ingredient objects of any dish (use object cloning!)"+because;
            
            expect(ret1[0]).to.not.equal(dishesConst[1].ingredients[0], differentObject);
            expect(ret1[3]).to.not.equal(dishesConst[1].ingredients[3], differentObject);
            
            model.dishes= [dishesConst[4], dishesConst[1]];
            const returned= model.getIngredients();

            const addUp= "if an ingredient name is present in multiple dishes from the menu, their quantities must be added up";
            expect(returned).to.include.deep.members([{quantity: 5, price: 10, name: "eggs", unit:''}], addUp);
            expect(returned).to.include.deep.members([{quantity: 80, price: 0, name: "water", unit:'ml'}], addUp+" . Ingredient names must be exactly the same, ===; quantities of ingredients with similar names will not be added up!");

            const expected= [{"name":"extra lean ground beef","quantity":115,"unit":"g","price":20},{"name":"sea salt","quantity":0.5,"unit":"g","price":3},{"name":"small onion, diced","quantity":0.25,"unit":"","price":2},{"name":"garlic salt","quantity":0.5,"unit":"g","price":2},{"name":"Italian seasoning","quantity":0.5,"unit":"g","price":3},{"name":"dried oregano","quantity":0.5,"unit":"g","price":3},{"name":"crushed red pepper flakes","quantity":0.5,"unit":"g","price":3},{"name":"Worcestershire sauce","quantity":6,"unit":"ml","price":7},{"name":"milk","quantity":20,"unit":"ml","price":4},{"name":"grated Parmesan cheese","quantity":5,"unit":"g","price":8},{"name":"seasoned bread crumbs","quantity":15,"unit":"g","price":4},{"name":"eggs","quantity":5,"unit":"","price":10},{"name":"water-activated dry yeast","quantity":0.5,"unit":"g","price":4},{"name":"water","quantity":80,"unit":"ml","price":0},{"name":"all-purpose flour","quantity":15,"unit":"g","price":2}];
            expect(returned).to.include.deep.members(expected, addUp);
            expect(returned.length).to.equal(expected.length, "the length of the ingredient list should be equal to the total number of ingredients from dishes, where ingredients with the same name are counted only once");
        });
        
    });
        
    
    describe("Bonus 2: function chains, reduce() with array/object accumulators", function bonusSuiteCB() {
        it("getIngredients  should be a function chain like array.reduce(CB1, acc1).reduce(CB2, acc2)", function checkChainCB(){
            const matches= [...removeComments(model.getIngredients).matchAll( /\.reduce\s*\(/g)];
            expect(matches.length, "getIngredients  should be a reduce function chain of two reduce()").to.equal(2);
        });
        testFunctional(model.getIngredients);
        noAssignment(model.getIngredients);
    });

});

