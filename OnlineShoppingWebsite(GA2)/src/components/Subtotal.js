import React from 'react'
import "./Subtotal.css";
import Currencyformat from 'react-currency-format'
import { useStateValue } from './StateProvider';
import {useHistory} from 'react-router-dom'

function Subtotal() {

    const [{basket}]=useStateValue();
    const history=useHistory();
    
    const getBasketTotal=(basket)=>{
        let sum=0;
        basket.map(item=>{
            sum=sum+item.price;
            })
        return sum; 
    }
    
    return (
        <div className="subtotal">
            <Currencyformat
                renderText={(value)=>(
                    <>
                        <p>Subtotal ({basket?.length} items):<strong>{value}</strong></p>
                        <small>
                            <input type="checkbox" />
                            This order contains a gift
                        </small>
                        <button onClick={(e)=> history.push("/checkout")}>Proceed to Checkout</button> 
                    </>
                )}
                decimalScale={2}
                value={getBasketTotal(basket)}
                displayType={"text"}
                thousandSeparator={true}
                prefix={"₹"}
                suffix={"/-"}
            />
        </div>  
    )
}

export default Subtotal
