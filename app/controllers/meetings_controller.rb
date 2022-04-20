class MeetingsController < ApplicationController

  
  def index
    plan_make
    @meetings = Meeting.all

  end


  private 
  def plan_make 

    ApplicationRecord.connection.create_table('plans', temporary: true, force: true )do |t|
    t.string :name
    t.text   :start_time
    t.timestamps
    end

    Object.const_set('Plan', Class.new(ApplicationRecord))

    datetime_from = DateTime.parse('2022-04-01 00:00:00') 
    datetime_to   = DateTime.parse('2022-04-30 00:00:00') 
    10.times do |i|
      Plan.create(name:"test #{i}"  ,start_time:rand(datetime_from..datetime_to) )
    plan =  Plan.new
      
    end

    @plans = Plan.all

  end


end
