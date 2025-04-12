import { useEffect, useState } from "react";


export default function useLocalStorage(key, defaultValue) {
    const [value, setValue] = useState(() => {
      let currentValue;
      const storedValue = localStorage.getItem(key);
  
      if (storedValue) {
        try {
          currentValue = JSON.parse(storedValue);
        } catch (error) {
          console.log(error);
          currentValue = defaultValue;
        }
      } else {
        currentValue = defaultValue;
      }
  
      return currentValue;
    });
  
    useEffect(() => {
      if (typeof window !== "undefined") {
        localStorage.setItem(key, JSON.stringify(value));
      }
    }, [key, value]);
  
    return [value, setValue];
  }
  
