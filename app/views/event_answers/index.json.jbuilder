json.array!(@event_answers) do |event_answer|
  json.extract! event_answer, :id, :answer, :next_type, :next_id
  json.url event_answer_url(event_answer, format: :json)
end
