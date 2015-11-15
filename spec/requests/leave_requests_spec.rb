require 'rails_helper'

RSpec.describe "LeaveRequests", type: :request do
  describe "create new leave_request" do
    it "should 403 without admin login" do
      employee = create :employee
      employee2 = create :employee, name: 'two'
      leave_attrs = attributes_for :leave_request
      login employee2
      post "/members/#{employee.id}/leave_requests", leave_request: leave_attrs
      expect(response).to have_http_status(403)
    end

    it "create new leave_request with valide input" do
      employee = create :employee
      leave_attrs = attributes_for :leave_request
      login employee
      post "/members/#{employee.id}/leave_requests", leave_request: leave_attrs
      leave_request = employee.reload.leave_requests.last
      expect(response).to have_http_status(201)
      expect(response.headers['Location']).to end_with("/leave_requests/#{leave_request.id}")
    end

    it 'should fail with invalid input' do
      employee = create :employee
      login employee
      post "/members/#{employee.id}/leave_requests", leave_request: {'abc' => '123'}
      expect(response).to have_http_status(400)
    end
  end

  describe "get one leave_request" do
    it "should get one leave_request" do
      employee = create :employee
      leave_attrs = attributes_for :leave_request
      leave_request = employee.leave_requests.create leave_attrs

      login(employee)
      get "/members/#{employee.id}/leave_requests/#{leave_request.id}"
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body)
      expect(data['title']).to eq(leave_request.title)
      expect(data['status']).to eq(leave_request.status.to_s)
    end

    it "should 404" do
      employee = create :employee
      leave_attrs = attributes_for :leave_request
      leave_request = employee.leave_requests.create leave_attrs

      login(employee)
      get "/members/#{employee.id}/leave_requests/123"
      expect(response).to have_http_status(404)
    end
  end

  describe "list leave_requests" do
    it "should list leave_requests" do
      5.times do |i|
        create :employee, name: "name_#{i}"
      end
      leave_request = create :employee
      login(leave_request)
      get "/leave_requests"
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body)
      expect(data.size).to eq(6)
      first = data[0]
      expect(first["name"]).to eq("name_0")
    end
  end
end
