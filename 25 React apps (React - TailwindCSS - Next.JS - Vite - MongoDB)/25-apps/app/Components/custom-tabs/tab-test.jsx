"use client";
import Tabs from "./tabs";
import './tabs.css';

function RandomComponent(){
    return <h1>Random content</h1>
}

export default function TabTest(){


    const tabs = [
        {
            label : 'tab 1',
            content : <div>Content of tab 1</div>
        },
        {
            label : 'tab 2',
            content : <div>Content of tab 2</div>
        },
        {
            label : 'tab 3',
            content : <RandomComponent />
        }
    ]


    function handleChange(currentTabIndex){
        console.log(currentTabIndex);
    }

    return <Tabs tabsContent={tabs} onChange={handleChange}/>
}