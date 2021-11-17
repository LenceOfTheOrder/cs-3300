require "rails_helper"

RSpec.describe "The math below is wrong..." do
  it "should equal 42 but we said 43" do
    expect(6 * 7).to eq(42)
  end
end

RSpec.describe "hello spec" do
  # ...
  describe String do
    let(:string) { String.new }
    it "should provide an empty string" do
      expect(string).to eq("")
    end
  end
 end
