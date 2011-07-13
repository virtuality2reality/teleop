class StubController < ActionController::Base
  def test
    render :nothing => true
  end
end