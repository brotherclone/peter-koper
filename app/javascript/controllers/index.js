import { application } from "./application"

import HelloController from "./hello_controller"
import ResetController from "./reset_controller"
import GuestBookChallengeController from  "./guestbook_challenge_controller"

application.register("hello", HelloController)
application.register("reset", ResetController)
application.register("challenge", GuestBookChallengeController)
