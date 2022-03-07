import { application } from "./application"

import GuestBookChallengeController from  "./guestbook_challenge_controller"
import StreamController from "./stream_controller"

application.register("challenge", GuestBookChallengeController)
application.register("stream", StreamController)