"use client";
import { createContext, useContext, useEffect, useState } from "react";
import featureFlagsDataServiceCall from "../data";

export const FeatureFlagsContext = createContext(null);

export default function FeaturedFagGlobalState({ children }) {
  const [loading, setLoading] = useState(false);
  const [enabledFlags, setEnabledFlagas] = useState({});

  async function fetchFeaturedFlags() {
    try {
      setLoading(true);
      const response = await featureFlagsDataServiceCall();
      console.log(response);
      setEnabledFlagas(response);
      setLoading(false);
    } catch (error) {
      console.log(error);
      setLoading(false);
      throw new Error(error);
    }
  }
  useEffect(() => {
    fetchFeaturedFlags();
  }, []);

  return (
    <FeatureFlagsContext.Provider value={{ loading, enabledFlags }}>
      {children}
    </FeatureFlagsContext.Provider>
  );
}
