import { application } from "./application"

import GuestBookChallengeController from "./guestbook_controller"


application.register("guest", GuestBookChallengeController)
