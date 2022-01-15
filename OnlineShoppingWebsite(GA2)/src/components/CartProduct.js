import React from 'react'
import './CartProduct.css'

function CartProduct(props) {

    const {img,description,price,rating}=props

    const removeFromBasket=()=>{
        
    }

    return (
        <div className="cartProduct">
            <img src={img} alt=""/>
            <div>
                <div>{description}</div>
                <strong>₹{price}</strong>
                <div>{Array(rating).fill().map((_,i)=>(
                    <span>⭐</span>))}
                </div>
                <button onClick={removeFromBasket}>Remove from Cart</button>
            </div>
        </div>
    )
}

export default CartProduct
