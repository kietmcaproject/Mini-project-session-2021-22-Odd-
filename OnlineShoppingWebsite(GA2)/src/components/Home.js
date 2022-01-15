import React from 'react'
import './Home.css'
import Keyboard from './Assets/Keyboard.jpg'
import Product from './Product'

import Samsung from './product/Samsung.jpg'
import Bag from './product/Bag.jpg'
import  Laptop from './product/Laptop.jpg'
import Earbud from './product/Earbud.jpg'
import AC from './product/AC.jpg'
import Display from './product/Display.jpg'

function Home() {

    return (
        <div className="home">
            
            <img className="home_banner" src={Keyboard} alt="Banner"/>
             
            <div className="home_product">
                <Product id={1} Description="LG 22 inch (55cm) IPS Monitor - Full HD, IPS Panel with VGA, HDMI, DVI, Audio Out Ports - 22MP68VQ" price={24999} rating={4} image={Display} />
                <Product id={2} Description=" Lenovo IdeaPad Flex 5i 10th Gen Intel Core i3 14 inch Full HD IPS 2-in-1 Convertible Laptop (4GB/256GB SSD/Windows 10/MS Office 2019/Graphite Grey/1.5Kg), 81X100NCIN " price={59999} rating={5} image={Laptop}/>
            </div>
            
            <div className="home_product">
                <Product id={3} Description="POLESTAR XPLORE 55 ltrs with Rain Cover Rucksack Hiking Backpack" price={4999} rating={4} image={Bag}/>
                <Product id={4} Description="boAt Airpodes 121v2 TWS Earbuds with Bluetooth V5.0, Immersive Audio, Up to 14H Total Playback, Instant Voice Assistant,(Active Black)" price={1999} rating={3} image={Earbud}/>
                <Product id={5} Description="Samsung Galaxy M31s (Space Black, 8GB RAM, 128GB Storage) " price={21999} rating={4} image={Samsung}/>
            </div>

            <div className="home_product">
                  <Product id={6} Description="Blue Star 1.5 Ton 3 Star Split AC (Copper, 2018 Model, FS318AATX, White)" price={34999} rating={3} image={AC}/>
            </div>

        </div>
    )
}

export default Home
