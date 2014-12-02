
module ToDo
	module Repositories
		class TaskRepository
			include Lotus::Repository
		end
	end
end

repo = ToDo::Repositories::TaskRepository.new

#exemple
#repo.all
#repo.find (5)
#repo.first
#repo.later
#repo.clear
