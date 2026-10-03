import React, { useState, useEffect } from "react";
import axios from "axios";

function App() {
    const [flights, setFlights] = useState([]);

    useEffect(() => {
        axios.get("http://localhost:5001/api/flights")
            .then(response => setFlights(response.data))
            .catch(error => console.error("Error fetching flights:", error));
    }, []);

    return (
        <div style={{ padding: "20px", fontFamily: "Arial" }}>
            <h1>🛫 Danh sách chuyến bay</h1>
            <ul>
                {flights.map(flight => (
                    <li key={flight.id}>
                        ✈️ {flight.from} → {flight.to} ({flight.date} {flight.time}) - {flight.price}$
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default App;
