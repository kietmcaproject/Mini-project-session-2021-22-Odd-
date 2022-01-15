export const initialState ={
    basket : [],
}

const reducer = (state,action) => {
    switch(action.type){
        case 'ADD_TO_BASKET' :
            return {
                ...state,
                basket:[...state.basket,action.item],
            };
        case 'REMOVE_FROM_BASKET':
            return {
                
            }    
        default : 
            return state;    
    }
};
export default reducer;