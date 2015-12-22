class LiftsController < ApplicationController
  expose(:seshion) { current_user.seshions.find_by(id: params[:seshion_id]) }
  expose(:lift) { seshion.lifts.find_by(id: params[:id]) }
end
