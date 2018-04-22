class ResultsController < BasesController

  def index
    @test = Test.find(params[:test_id])
    @questions = @test.questions.includes(:results)
  end
end
