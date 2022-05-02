module QuestionsHelper
  def hidden_question(question)
    if question.hidden?
      "hidden"
    end
  end
end
