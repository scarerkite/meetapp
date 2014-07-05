Comment.delete_all

Comment.create!(
  event_id: 1,
  user_id: 7, 
  body: "Running 5 mins late, sorry!"
)

Comment.create!(
  event_id: 1,
  user_id: 1, 
  body: "We're sitting outside."
)

Comment.create!(
  event_id: 2,
  user_id: 2, 
  body: "Running half an hour late, nightmare traffic!"
)

Comment.create!(
  event_id: 2,
  user_id: 7, 
  body: "Running 10 mins late, sorry!"
)

Comment.create!(
  event_id: 3, 
  user_id: 4, 
  body: "Just got here - am I the first?"
)

Comment.create!(
  event_id: 3, 
  user_id: 5, 
  body: "No, we're upstairs."
)