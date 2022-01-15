import React from 'react'
import './Cart.css'
import Ad from './Assets/Ad.jpg'
import Subtotal from './Subtotal'
import { useStateValue } from './StateProvider'
import CartProduct from './CartProduct'


function Cart() {

    const[{basket},dispatch]=useStateValue();

    return (
        <div className="cart">
            <div className="cart_left">
                <img src={Ad} alt="" />
                <h2>Your shopping Cart</h2>

                <div className="cart_items">
                    { basket?.map(item=>(
                            <CartProduct
                            img={item.image}
                            description={item.Description} 
                            price={item.price}
                            rating={item.rating}
                            />))
                    }
                </div>
            </div> 
            
            <div className="cart_right">
                <Subtotal/>
            </div>
        </div>
    )
}

export default Cart
