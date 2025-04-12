"use client";

import useWindowResize from ".";



export default function UseWindowResizeTest(){

    const {width , height} = useWindowResize();
    return <div>
        <h1>Use window reize hook</h1>
        <p> Width is : {width}</p>
        <p> Height is : {height}</p>
    </div>
}