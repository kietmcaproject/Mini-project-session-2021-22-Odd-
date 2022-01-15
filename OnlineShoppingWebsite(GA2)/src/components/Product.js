import React from 'react'
import './Product.css'
import { useStateValue } from './StateProvider';

function Product(props) {
    const {id,Description ,price,rating,image}=props ;

    const [{basket},dispatch]=useStateValue();
     
    const addToBasket=()=>{
        //dispatch the data item into data layer
        dispatch({
            type: 'ADD_TO_BASKET',
            item : {
                id:id,
                Description:Description ,
                price:price,
                rating:rating,
                image:image
            }
        })
    }
    
    return (
        <div className="product ">

            <div className="product_description">
                {Description}
            </div>

            <strong className="product_price">
                ₹{price}
            </strong>
            

             <div className="product_rating">
                 {Array(rating).fill().map((_,i)=>(
                    <span>⭐</span>
                ))}
            </div>

            <img className="product_image" src={image} alt="product"/>

            <button onClick={addToBasket} >Add To Cart</button> 
        </div>
    )
}

export default Product
