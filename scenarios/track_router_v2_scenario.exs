defmodule ElixirMaruTraining.TrackRouterV2Scenario do
  use Exkorpion
  use Maru.Test, for: ElixirMaruTraining.TrackRouterV2
  alias ElixirMaruTraining.TrackResource 
  

  scenario "Testing TrackRouterV2 " do
		
 

 	it "Ensures that add new track service works as expected when testing on a real environment" do
 	  %{
 	  	with: fn ctx ->
          [
            %{new_track: %{"title" => "Runaway", "singer" => "John Bon Jovi"}},
            %{new_track: %{"title" => "Let her go", "singer" => "The passenger"}},
          ]
    	end,
    	given: &(%{new_track_json: &1.new_track |> Poison.encode!, previous_tracks: build_conn() |> get("/tracks", "v2") |> json_response |> Poison.decode! }),
 	  	when: fn ctx ->
 	  		%{result: build_conn() |> put_body_or_params(ctx.new_track) |> post("/tracks", "v2") |> json_response |> Poison.decode! }	  			
 	  	end,	
        then: fn ctx ->
          assert length(ctx.previous_tracks)+1 === length(ctx.result)
        end		
 	  }
	end

  end

end
