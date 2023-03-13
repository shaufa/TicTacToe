class Board

    def initialize
      @columns = {
          c1: ['', '', ''],
          c2: ['', '', ''],
          c3: ['', '', '']
      }
    end
  
    def check_win?(player)
        @options = {
            r1: [@columns[:c1][0], @columns[:c2][0], @columns[:c3][0]],
            r2: [@columns[:c1][1], @columns[:c2][1], @columns[:c3][1]],
            r3: [@columns[:c1][2], @columns[:c2][2], @columns[:c3][2]],
            d1: [@columns[:c1][0], @columns[:c2][1], @columns[:c3][2]],
            d2: [@columns[:c1][2], @columns[:c2][1], @columns[:c3][0]]
        }

        @columns.merge(@options).reduce(false) do |result, (key, value)|
            result = true if value.all?(player.token)
            result
        end

    end
  
    def move(player, position)
      case position[0]
      when 'a'
        if @columns[:c1][position[1].to_i - 1] == ''
          @columns[:c1][position[1].to_i - 1] = player.token
        else
          puts("#{position} is occupied, try another space")
        end
      when 'b'
        if @columns[:c2][position[1].to_i - 1] == ''
          @columns[:c2][position[1].to_i - 1] = player.token
        else
          puts("#{position} is occupied, try another space")
        end
      when 'c'
        if @columns[:c3][position[1].to_i - 1] == ''
          @columns[:c3][position[1].to_i - 1] = player.token
        else
          puts("#{position} is occupied, try another space")
        end
      end
    end
  
    def show()
      x = "███       ███\n ███     ███ \n  ███   ███  \n     ███     \n  ███   ███  \n ███     ███ \n███       ███\n"
      o = "   ███████   \n ███     ███ \n███       ███\n███       ███\n███       ███\n ███     ███ \n   ███████   \n"
      blank = "             \n             \n             \n             \n             \n             \n             \n"
      board = [] << @columns[:c1] << @columns[:c2] << @columns[:c3]
      result = ['    ', '    ', '    ']
      board.each_index do |column|
        board[column].each_index do |square|
          result[column] += case board[column][square]
                            when 'x'
                              column != 2 ? x.gsub(/\n/, "    ║\n    ") : x.gsub(/\n/, "    \n    ")
                            when 'o'
                              column != 2 ? o.gsub(/\n/, "    ║\n    ") : o.gsub(/\n/, "    \n    ")
                            else
                              column != 2 ? blank.gsub(/\n/, "    ║\n    ") : blank.gsub(/\n/, "    \n    ")
                            end
                            unless square == 2 
                              column != 2 ? result[column] += "                 ║\n═════════════════════╬\n                     ║\n    " : result[column] += "                 \n═════════════════════\n                     \n    "
                            end
                          end
                          result[column] << (column != 2 ? "                 ║" : "")
      end
      puts("                     ║                     ║                     \n")
      result << "                 ║                     ║                     "
      result[0].split("\n").each_index do |line|
        puts("#{result[0].split("\n")[line]}#{result[1].split("\n")[line]}#{result[2].split("\n")[line]}")
      end
      puts "\n"
    end
  end    