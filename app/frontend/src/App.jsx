// Frontend: React app with date input
// File: frontend/src/App.jsx
import React, { useState } from 'react';
import axios from 'axios';

function App() {
  const [eventName, setEventName] = useState('');
  const [eventDate, setEventDate] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    await axios.post('http://localhost:5000/events', { name: eventName, date: eventDate });
    alert('Event scheduled!');
  };

  return (
    <div className="p-10 max-w-md mx-auto">
      <h1 className="text-2xl font-bold mb-4">Event Reminder</h1>
      <form onSubmit={handleSubmit} className="space-y-4">
        <input
          type="text"
          value={eventName}
          onChange={(e) => setEventName(e.target.value)}
          placeholder="Event Name"
          className="border rounded p-2 w-full"
          required
        />
        <input
          type="date"
          value={eventDate}
          onChange={(e) => setEventDate(e.target.value)}
          className="border rounded p-2 w-full"
          required
        />
        <button type="submit" className="bg-blue-500 text-white px-4 py-2 rounded">Schedule</button>
      </form>
    </div>
  );
}

export default App;

