const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.post('/reminder', (req, res) => {
  const { date } = req.body;
  if (!date) return res.status(400).json({ message: 'Date is required' });

  const reminderDate = new Date(date);
  const now = new Date();

  if (reminderDate <= now) {
    return res.status(400).json({ message: 'Date must be in the future' });
  }

  // Simulated event trigger
  const msUntilReminder = reminderDate - now;
  setTimeout(() => {
    console.log(`Reminder: Event scheduled for ${reminderDate.toISOString()} triggered.`);
  }, msUntilReminder);

  res.status(200).json({ message: `Reminder set for ${reminderDate.toISOString()}` });
});

app.listen(port, () => console.log(`Server running on port ${port}`));
