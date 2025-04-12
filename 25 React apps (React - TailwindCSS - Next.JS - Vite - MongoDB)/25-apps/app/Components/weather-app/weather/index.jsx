"use client";
import { useEffect, useState } from "react";
import SearchCity from "../search";
import "./styles.css";
const apiKey = "6113d641f5cbc750a944d3a34fed23ac";

export default function Weather() {
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(false);
  const [weatherData, setWeatherData] = useState(null);

  useEffect(() => {
    fetchWeatherData("buenos aires");
  }, []);
  async function fetchWeatherData(params) {
    try {
      setLoading(true);
      const response = await fetch(
        `https://api.openweathermap.org/data/2.5/weather?q=${params}&appid=${apiKey}`
      );

      const result = await response.json();
      console.log(result);

      if (result) {
        setLoading(false);
        setWeatherData(result);
      }
    } catch (error) {
      console.log(error);
      setLoading(false);
    }
  }

  function handleSearch() {
    fetchWeatherData(search);
  }

  function getCurrentDate() {
    return new Date().toLocaleDateString("en-us", {
      weekday: "long",
      month: "long",
      day: "numeric",
      year: "numeric",
    });
  }

  return (
    <div className="weather-container">
      <SearchCity
        search={search}
        setSearch={setSearch}
        handleSearch={handleSearch}
      />
      {loading ? (
        <h3 className="loading-data">Data is loading, please wait</h3>
      ) : (
        <div className="weather-data">
          <div className="city-info">
            {
              <h2>
                {weatherData?.name}, <span>{weatherData?.sys?.country}</span>
              </h2>
            }
          </div>
          <div className="weather-date">
            <span>{getCurrentDate()}</span>
          </div>
          <div>
            <h5 className="subtitle">Temperatura:</h5>
            <p className="temp-number">{(weatherData?.main?.temp - 273.15).toFixed(1)} ºC</p>
          </div>
          <div className="weather-description">
            <h5 className="subtitle">Descripcion:</h5>
            <p>
              {weatherData && weatherData.weather && weatherData.weather[0]
                ? weatherData.weather[0].description
                : ""}
            </p>
          </div>
          <div className="weather-info">
            <div>
              <h5 className="subtitle">Velocidad del viento:</h5>
              <p className="wind">{weatherData?.wind?.speed}</p>
            </div>
            <div>
              <h5 className="subtitle">Humedad:</h5>
              <p className="humidity">{weatherData?.main?.humidity} %</p>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
