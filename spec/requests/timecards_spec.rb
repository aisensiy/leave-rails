require 'rails_helper'

RSpec.describe "Timecards", type: :request do
  before(:each) do
    @employee = create :employee
    timecard_attrs = attributes_for :timecard
    @timecard = @employee.timecards.create timecard_attrs
  end

  describe "create new timecard" do
    it "should 403 without system login" do
      employee2 = create :employee, name: 'two'
      timecard_attrs = attributes_for :timecard
      login employee2
      post "/members/#{@employee.id}/timecards", timecard: timecard_attrs
      expect(response).to have_http_status(403)
    end

    it "create new timecard with valide input" do
      timecard_attrs = attributes_for :timecard
      system = create :system
      login system
      post "/members/#{@employee.id}/timecards", timecard: timecard_attrs
      timecard = @employee.reload.timecards.last
      expect(response).to have_http_status(201)
      expect(response.headers['Location']).to end_with("/members/#{@employee.id}/timecards/#{timecard.id}")
    end

    it 'should fail with invalid input' do
      system = create :system
      login system
      post "/members/#{@employee.id}/timecards", timecard: {'abc' => '123'}
      expect(response).to have_http_status(400)
    end
  end

  describe "get one timecard" do
    it "should get one timecard" do
      login(@employee)
      get "/members/#{@employee.id}/timecards/#{@timecard.id}"
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body)
      expect(data['hour']).to eq(@timecard.hour)
      expect(data['date']).to eq(@timecard.date.to_s)
    end

    it "should 404" do
      login(@employee)
      get "/members/#{@employee.id}/timecards/123"
      expect(response).to have_http_status(404)
    end
  end

  describe "list timecards" do
    it "should list timecards" do
      employee = create :employee

      5.times do |i|
        attrs = attributes_for :timecard, title: "title_#{i}"
        employee.timecards.create attrs
      end

      login(employee)
      get "/members/#{employee.id}/timecards"
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body)
      expect(data.size).to eq(5)
      first = data[0]
      expect(first["title"]).to eq("title_0")
    end
  end

  describe "process timecards" do
    before(:each) do
      @employee = create :employee
      @manager = create :manager
      @employee.assign_to @manager

      timecard_attrs = attributes_for :timecard
      @timecard = @employee.timecards.create timecard_attrs
    end

    it "should approve request" do
      login(@manager)
      post "/members/#{@employee.id}/timecards/#{@timecard.id}/processed", approved: true
      expect(response).to have_http_status 200
      @timecard.reload
      expect(@timecard.approved?).to be(true)
    end

    it "should reject request" do
      login(@manager)
      post "/members/#{@employee.id}/timecards/#{@timecard.id}/processed", rejected: true
      expect(response).to have_http_status 200
      @timecard.reload
      expect(@timecard.rejected?).to be(true)
    end

    it "should 403 if not @employee's manger" do
      login(@employee)
      post "/members/#{@employee.id}/timecards/#{@timecard.id}/processed", rejected: true
      expect(response).to have_http_status 403
    end
  end
end
