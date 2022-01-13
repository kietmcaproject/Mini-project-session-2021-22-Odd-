import React,{createContext,useReducer,useContext} from 'react'

export const StateContext = createContext();   //prepares the dataLayer 

//wrap our app and provide the data layer
export const StateProvider = ({ reducer, initialState,children})=> {
    return (
        <StateContext.Provider value={useReducer(reducer,initialState)}>
            {children}
        </StateContext.Provider>
    )
}

//pull information from data layer
export const useStateValue=()=> useContext(StateContext);