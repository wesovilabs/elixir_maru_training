defmodule ElixirMaruTraining.TrackRouterV1Scenario do
  use Exkorpion
  use Maru.Test, for: ElixirMaruTraining.TrackRouterV1
  alias ElixirMaruTraining.TrackResource
  

  scenario "Testing TrackRouterV1 - Mocked results" do
		
 	it "Ensures that get tracks service returns always 2 elements" do
	  %{
 		when: fn _ ->
 		  %{result: build_conn() |> get("/tracks", "v1") |> json_response |> Poison.decode! }
 		end,	
 		then: fn ctx ->
		  assert 2 === length(ctx.result)
 		end		
 	  }
 	end

 	it "Ensures that add new track service works as expected" do
 	  %{
 	  	with: fn ctx ->
          [
            %{new_track: %{"title" => "Runaway", "singer" => "John Bon Jovi"}},
            %{new_track: %{"title" => "Let her go", "singer" => "The passenger"}},
          ]
    	end,
    	given: &(%{new_track_json: &1.new_track |> Poison.encode!, previous_tracks: build_conn() |> get("/tracks", "v1") |> json_response |> Poison.decode! }),
 	  	when: fn ctx ->
 	  		%{result: build_conn() |> put_body_or_params(ctx.new_track) |> post("/tracks", "v1") |> json_response |> Poison.decode! }	  			

 	  	end,	
        then: fn ctx ->
          assert length(ctx.previous_tracks)+1 === length(ctx.result)
          assert true === Enum.member?(ctx.result, ctx.new_track)
        end		
 	  }
	end


  end

end