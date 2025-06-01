require('dotenv').config();
const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = process.env.PORT || 3000;

// PostgreSQL client pool
const pool = new Pool();

app.use(express.json());

app.post('/reminder', async (req, res) => {
  const { name, date } = req.body;

  if (!date || !name) {
    return res.status(400).json({ message: 'Event name and date are required' });
  }

  const reminderDate = new Date(date);
  const now = new Date();

  if (reminderDate <= now) {
    return res.status(400).json({ message: 'Date must be in the future' });
  }

  try {
    // Save event to PostgreSQL
    await pool.query(
      'INSERT INTO events (name, date) VALUES ($1, $2)',
      [name, reminderDate]
    );

    // Simulate reminder trigger
    const msUntilReminder = reminderDate - now;
    setTimeout(() => {
      console.log(`⏰ Reminder triggered for event "${name}" at ${reminderDate.toISOString()}`);
    }, msUntilReminder);

    res.status(200).json({ message: `Reminder set for "${name}" on ${reminderDate.toISOString()}` });
  } catch (err) {
    console.error('Database error:', err);
    res.status(500).json({ message: 'Failed to save reminder' });
  }
});

app.listen(port, () => {
  console.log(`✅ Server running on port ${port}`);
});
