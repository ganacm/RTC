require 'spec_helper'

RSpec.describe ProcessService do
  let(:dollar_format) {File.read('spec/fixtures/people_by_dollar.txt')}
  let(:percent_format) {File.read('spec/fixtures/people_by_percent.txt')}


  context "#initialize" do
    context "ProcessPercentService initialization" do
      it "should call ProcessService initialize  and call add_to_parent" do
        expect_any_instance_of(ProcessService).to receive(:add_to_parent).and_call_original
        parser = ProcessPercentService.new(percent_format)
      end
    end

    context "ProcessDollarService initialization" do
      it "should call ProcessService initialize and call add_to_parent" do
        expect_any_instance_of(ProcessService).to receive(:add_to_parent).and_call_original
        parser = ProcessDollarService.new(dollar_format)
      end
    end
  end

  context "#getSortedValues" do
    it "calls sorted " do
      parser = ProcessDollarService.new(dollar_format)
      expect(ProcessService).to receive(:sort_row).with("first_name").and_call_original
      parser.class.send(:getSortedValues, "first_name")
    end
  end


end