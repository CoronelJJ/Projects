"use client";
import { useRef, useState } from "react";
import UseOnclickOutside from ".";


export default function OutsideClickHookTest(){
   
    const [showContent, setShowContent] = useState(false);
    const ref = useRef();
    UseOnclickOutside(ref, ()=> setShowContent(false));

    return (
      <div>
        {showContent ? (
          <div ref={ref}>
              <h1>Content here</h1>
              <p>Click outside to hide this</p>
          </div>
        ) : (
          <button onClick={() => setShowContent(true)}>Show content</button>
        )}
      </div>
    );
}