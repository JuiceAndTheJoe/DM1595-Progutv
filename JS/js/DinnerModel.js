//DinnerModel class
class DinnerModel {

    // The constructor is invoked when we write         new DinnerModel()
    constructor() {
        // note that you always need to use "this." when you refer to an object property!
        this.guests= 2;
        // TODO: set this.dishes to an empty array, (i.e. the menu is initially empty), see Arrays in course material
        this.dishes = [];
    }
    
    /* Week 1: Set the number of guests to the given value. 
       The value must be a positive integer, throw an Error otherwise.
       To check for integer, see the JavaScript Number class (see constants and data types in course material)
     */
    setNumberOfGuests(num) {
        // TODO in case num is not a poisitive integer throw an error with the message
        //          "number of guests not a positive integer"
        // 
        // this.guests= TODO ;
        this.guests= num;
        if (!Number.isInteger(this.guests) || this.guests < 1) {
            throw new Error("number of guests not a positive integer");
        }
    }

    /* Week 1:  add a dish to the menu. If a dish with the same type already exists, remove it first. 
    */
    addToMenu(dish) {
        // a possible stepwise way to approach this:
        // 1: use "array spread syntax" to append to the dishes. 
        // 2: to pass all addToMenu tests (maybe after implementing removeFromMenu and dishOfType) use filter(CB) to remove the dish with the same type (if any) and append the dish to the filter() result
        function checkTypeCB(d) {
            // If dish.type is not defined or d.type !== dish.type, keep the dish
            return !dish.type || d.type !== dish.type;
        }
        this.dishes = [...this.dishes.filter(checkTypeCB), dish];
    }
    
    /* Remove dish from the menu. Identify the dish by its id. The parameter is an object which has an id property.
       model.removeFromMenu({id:3})
       See array.filter(CB) in course material
     */
    removeFromMenu(dish) {
        function filterIdCB(d) {
            // If ids don't match, keep the dish
            return d.id !== dish.id;
        }
        this.dishes = this.dishes.filter(filterIdCB);
    }

    /* Week 1: Return the dish of the given type from the menu, or undefined if no dish of the indicated type is in the menu */
    getDishOfType(type){
        function findTypeCB(dish){
            // If dish.type matches the look-up term type, return the dish
            return dish.type === type;
        }
        return this.dishes.find(findTypeCB);
    }

    /* Return the menu for code outside the class/object that may need it */
    getMenu(){
        return [...this.dishes]; // return a copy of the dishes array
    }
    
    /* Week 2: Total price for the dinner given the number of guests 
     */
    getDinnerPrice(){
        function sumDishPriceCB(total, dish) {
            // Sum the price of each dish
            return total + DishSource.getDishPrice(dish);
        }
        return this.dishes.reduce(sumDishPriceCB, 0) * this.guests;
    }
    
    /* Week 1 Bonus: Return an array of ingredients for the DinnerModel dishes, with each ingredient showing up maximum once, and the quantities added up. 
       Assume that the ingredient measurement units and prices are the same in all dishes that use a certain ingredient.

       Hint: use the fact that JS objects are Dictionaries, you can use the ingredient name as key 
       - therefore you can check whether you have encountered a certain ingedient (if so, add the quantity)
       - if you have not encountered the ingerdient yet, just set the initial quantity

       Week 2 Bonus: implement functionally, with no assignments, using a method chain and and object cloning 
    */
    getIngredients(){
        return this.dishes
            .flatMap(dish => dish.ingredients) // get all ingredients of all dishes into a single array
            .reduce((acc, ingredient) => {
                // If the ingredient name exists in accumulator, add quantity to existing ingredient
                // Otherwise, add the ingredient as a new entry
                const existingIngredient = acc.find(i => i.name === ingredient.name);
                if (existingIngredient) {
                    // Create a new array with all ingredients except the one with matching name
                    return [
                        ...acc.filter(i => i.name !== ingredient.name),
                        { ...existingIngredient, quantity: existingIngredient.quantity + ingredient.quantity }
                    ];
                } else {
                    // Add a clone of the ingredient to the array
                    return [...acc, { ...ingredient }];
                }
            }, []);
    }
}

/* A source of dish data, implemented with data from dishesConst.js. 

   We illustrate another way to define an object with methods: simply use an object literal rather than a class. 
*/
const  DishSource={
    /* Week 1: Returns a dish of specific ID, filter(CB) exercise */
    getDishDetails(id) {
        function findDishCB(dish) {
            return dish.id === id;
        }
        return dishesConst.find(findDishCB);
    },

    /* 
       Week 1: Search for dishes (filter(CB) exercise). 
       searchParam can have the following properties (search criteria):
       - type: the dish type
       - query: free text in dish name, see the someString.includes(x) JS method
       If no search criterion is specified, all dishes are returned.
       Example use: 
       DishSource.searchDishes({type:"main course", query:"izz"})   returns e.g. pizzas marked as main course
       DishSource.searchDishes({type:"main course"})
       DishSource.searchDishes({query:"Meatba"})
       DishSource.searchDishes({type:""})  returns all dishes
       DishSource.searchDishes({query:""})  returns all dishes
       DishSource.searchDishes({})  returns all dishes

       Week 2: to implement functionally, without any (procedural) if() statement, note that x.includes("") always returns true. So use a logical experssion that evaluates to "" if the query is absent from searchParams. Same for the type.
    */
    searchDishes(searchParams) {
        // Function to filter dishes by type
        function filterByTypeCB(dish) {
            // If no type is specified (searchParams.type is undefined or empty) OR
            // dish.type matches searchParams.type, keep the dish
            return !searchParams.type || dish.type === searchParams.type;
        }
        
        // Function to filter dishes by name query
        function filterByNameCB(dish) {
            // If no query is specified (searchParams.query is undefined or empty) OR
            // dish.name includes searchParams.query (case insensitive), keep the dish
            return !searchParams.query || dish.name.toLowerCase().includes(searchParams.query.toLowerCase());
        }
        
        // Start with all dishes, then filter by type, then filter by name query
       // Each filter() creates a new array without modifying the original
        return dishesConst
            .filter(filterByTypeCB)    // First filter by type
            .filter(filterByNameCB);   // Then filter the remaining dishes by name
    }, // comma after last object member (property, method) is accepted, so that members can easily be moved around

    /* Week 2: Utility method do compute a dish price depending on its ingredient prices and quantities.
      see reduce(CB, acc) in course material
    */
    getDishPrice(dish){
        function sumIngredientPriceCB(total, ingredient) {
            return total + ingredient.price * ingredient.quantity;
        }
        return dish.ingredients.reduce(sumIngredientPriceCB, 0);
    },

};  /* good to have a semicolon after a let or const declaration */

