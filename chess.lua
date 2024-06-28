os.execute("clear")

board = {}
B_SIZE = 8

KING= "♚"
QUEEN= "♛"
ROOK= "♜"
BISHOP = "♝"
KNIGHT = "♞"
PAWN = "♟︎"

W_KING= "♔"
W_QUEEN= "♕"
W_ROOK= "♖"
W_BISHOP = "♗"
W_KNIGHT = "♘"
W_PAWN = "♙"

board = {}
board[1]= {ROOK, KNIGHT, BISHOP, KING, QUEEN, BISHOP, KNIGHT, ROOK}
board[2] = {PAWN, PAWN, PAWN, PAWN, PAWN, PAWN, PAWN, PAWN}
board[3] = {" "," "," "," "," "," "," "," "}
board[4] = {" "," "," "," "," "," "," "," "}
board[5] = {" "," "," "," "," "," "," "," "}
board[6] = {" "," "," "," "," "," "," "," "}
board[7] = {W_PAWN, W_PAWN, W_PAWN, W_PAWN, W_PAWN, W_PAWN, W_PAWN, W_PAWN}
board[8]= {W_ROOK,W_KNIGHT, W_BISHOP, W_QUEEN, W_KING, W_BISHOP, W_KNIGHT, W_ROOK}

local function is_white (val)
    for index, value in ipairs(board[7]) do
        if value == val then
            return true
        end
    end
    
    for index, value in ipairs(board[8]) do
        if value == val then
            return true
        end
    end

    return false
end

local function starts_with(str, start)
   return str:sub(1, #start) == start
end

function print_table(table) 
    for i, v in ipairs(table) do
	row = ""
	for j, w in ipairs(v) do
		local new_piece = nil 
		local bg_color = ""
		if j%2==0 and i%2==0 then bg_color = '\x1b[40m' end
		if j%2~=0 and i%2~=0 then bg_color = '\x1b[40m' end
		if is_white(w) then 
			new_piece = bg_color .. " " ..  w .. " "  ..'\27[0m'
		else 
			new_piece = bg_color .. '\27[31m'.. " " ..  w .. " " ..'\27[0m' 
		end
	  	row = row .. new_piece    
	end
	print(row)
    end	    
end

local function move_piece()

local game_is_running = true
local input = ""
while game_is_running do
	print_table(board)
	print("Last Move: ".. input) 
	input =  io.read()
	if input == 'q' or input == ':q' then
		game_is_running = false
		print("Game is Over!")
	else
		os.execute("clear")
	end

end


