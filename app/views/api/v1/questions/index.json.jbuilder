json.array! @questions do |question|
  json.id question.id
  json.view_count  question.view_count
  json.title question.title
  json.created_at question.created_at.strftime("%Y-%B-%d")
  json.path api_v1_question_path(question)
  json.category question.category_name if question.category
  json.aauser do
    json.first_name question.aauser_first_name
    json.last_name  question.aauser_last_name
  end
  json.answers question.answers do |answer|
    json.id   answer.id
    json.body answer.body
  end
end
