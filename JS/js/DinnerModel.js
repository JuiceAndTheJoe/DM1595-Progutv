//DinnerModel class
class DinnerModel {

    // The constructor is invoked when we write         new DinnerModel()
    constructor() {
        // note that you always need to use "this." when you refer to an object property!
        this.guests= 2;
        // TODO: set this.dishes to an empty array, (i.e. the menu is initially empty), see Arrays in course material
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
    }

    /* Week 1:  add a dish to the menu. If a dish with the same type already exists, remove it first. 
    */
    addToMenu(dish) {
        // a possible stepwise way to approach this:
        // 1: use "array spread syntax" to append to the dishes. 
        // 2: to pass all addToMenu tests (maybe after implementing removeFromMenu and dishOfType) use filter(CB) to remove the dish with the same type (if any) and append the dish to the filter() result
    }
    
    /* Remove dish from the menu. Identify the dish by its id. The parameter is an object which has an id property.
       model.removeFromMenu({id:3})
       See array.filter(CB) in course material
     */
    removeFromMenu(dish) {
        //TODO 
    }

    /* Week 1: Return the dish of the given type from the menu, or undefined if no dish of the indicated type is in the menu */
    getDishOfType(type){
        //TODO 
    }

    /* Return the menu for code outside the class/object that may need it */
    getMenu(){
        // TODO
    }
    
    /* Week 2: Total price for the dinner given the number of guests 
     */
    getDinnerPrice(){
        //TODO 
    }
    
    /* Week 1 Bonus: Return an array of ingredients for the DinnerModel dishes, with each ingredient showing up maximum once, and the quantities added up. 
       Assume that the ingredient measurement units and prices are the same in all dishes that use a certain ingredient.

       Hint: use the fact that JS objects are Dictionaries, you can use the ingredient name as key 
       - therefore you can check whether you have encountered a certain ingedient (if so, add the quantity)
       - if you have not encountered the ingerdient yet, just set the initial quantity

       Week 2 Bonus: implement functionally, with no assignments, using a method chain and and object cloning 
    */
    getIngredients(){

    }
}

/* A source of dish data, implemented with data from dishesConst.js. 

   We illustrate another way to define an object with methods: simply use an object literal rather than a class. 
*/
const  DishSource={
    /* Week 1: Returns a dish of specific ID, filter(CB) exercise */
    getDishDetails(id) {
        //TODO 
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
        //TODO 
    }, // comma after last object member (property, method) is accepted, so that members can easily be moved around

    /* Week 2: Utility method do compute a dish price depending on its ingredient prices and quantities.
      see reduce(CB, acc) in course material
    */
    getDishPrice(dish){
        //TODO 
    },

};  /* good to have a semicolon after a let or const declaration */

