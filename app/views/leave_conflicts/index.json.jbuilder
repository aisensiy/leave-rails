json.array!(@leave_conflicts) do |leave_conflict|
  json.extract! leave_conflict, :id
  json.url leave_conflict_url(leave_conflict, format: :json)
end
