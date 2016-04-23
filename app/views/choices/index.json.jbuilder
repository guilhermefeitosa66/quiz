json.array!(@choices) do |choice|
  json.extract! choice, :id, :description, :correct, :question_id
  json.url choice_url(choice, format: :json)
end
