class SeshionsController < ApplicationController
  expose(:seshion) { current_user.seshions.find(params[:id]) }
  expose(:workout) { seshion.workout }
  expose(:seshion_exercises) { seshion.seshion_exercises }
end
