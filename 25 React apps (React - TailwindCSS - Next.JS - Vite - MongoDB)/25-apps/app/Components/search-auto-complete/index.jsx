"use client";
import { useEffect, useState } from "react";
import Suggestions from "./suggestions";

export default function SearchAutoComplete() {
  const [loading, setLoading] = useState(false);
  const [users, setUsers] = useState([]);
  const [error, setError] = useState(null);
  const [searchParam, setSearchParam] = useState("");
  const [showDropdown, setShowDropdown] = useState(false);
  const [filteredUsers, setFilteredUsers] = useState([]);

  function handleInputChange(event) {
    const query = event.target.value.toLowerCase();
    setSearchParam(query);
    if (query.length > 1) {
      const filteredData =
        users && users.length
          ? users.filter((item) => item.toLowerCase().indexOf(query) > -1)
          : [];
      setFilteredUsers(filteredData);
      setShowDropdown(true);
    } else {
      setShowDropdown(false);
    }
  }

  function handleClick(event){
    setShowDropdown(false);
    setSearchParam(event.target.innerText);
    setFilteredUsers([]);
  }

  async function fetchListOFUsers(params) {
    try {
      setLoading(true);
      const response = await fetch("https://dummyjson.com/users");
      const data = await response.json();

      if (data && data.users && data.users.length > 0) {
        setUsers(data.users.map((userItem) => userItem.firstName));
        setLoading(false);
        setError(null);
      }
    } catch (error) {
      console.log(error);
      setError(error);
      setLoading(false);
    }
  }
  useEffect(() => {
    fetchListOFUsers();
  }, []);

  return (
    <div className="search-autocomplete-container">
      {loading ? (
        <h1>Loading data please wait</h1>
      ) : (
        <input
          type="text"
          value={searchParam}
          name="search-users"
          placeholder="Search for users..."
          onChange={handleInputChange}
        />
      )}
      {showDropdown ? (
        <Suggestions data={filteredUsers} handleClick={handleClick} />
      ) : null}
    </div>
  );
}
