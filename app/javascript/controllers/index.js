import { application } from "./application"

import GuestBookChallengeController from "./guestbook_controller"
import StreamController from "./stream_controller"

application.register("guest", GuestBookChallengeController)
application.register("stream", StreamController)