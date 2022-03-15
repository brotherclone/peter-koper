import { application } from "./application"

import GuestBookChallengeController from "./guestbook_controller"
import MediaModalController from "./media_modal_controller"

application.register("media", MediaModalController)
application.register("guest", GuestBookChallengeController)
