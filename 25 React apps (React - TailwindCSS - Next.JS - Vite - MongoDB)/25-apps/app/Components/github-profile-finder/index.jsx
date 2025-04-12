"use client";
import { useEffect, useState } from "react";
import User from "./user";
import './styles.css';

export default function GithubProfileFinder() {
  const [username, setUsername] = useState("CoronelJJ");
  const [userData, setUserData] = useState(null);
  const [loading,setLoading] = useState(false);

  async function fetchGitHubUserData(params) {
    setLoading(true);
    const response = await fetch(`https://api.github.com/users/${username}`);

    const data = await response.json();
    
    if (data){
    setUserData(data);
    setLoading(false);
    setUsername('');
    }
  }

  function handleSubmit() {
    fetchGitHubUserData();
  }

  useEffect(() => {
    fetchGitHubUserData();
  }, []);

  if (loading){
    return <h1>Loading data please wait</h1>
  }
  return (
    <div className="github-profile-container">
      <div className="github-input-wrapper">
        <input
          name="targetProfile"
          type="text"
          placeholder="Search Username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <button onClick={handleSubmit}>Search</button>
      </div>
      {
        userData !== null ? <User user={userData} />: null
      }
    </div>
  );
}
