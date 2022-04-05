import { application } from "./application"

import GuestBookChallengeController from "./guestbook_controller"
import MediaModalController from "./media_modal_controller"
import StreamController from "./stream_controller"
import HomeController from "./home_controller"
import MobileMenuController from "./mobile_menu_controller"
import BackController from "./back_controller"

application.register("home", HomeController)
application.register("media", MediaModalController)
application.register("guest", GuestBookChallengeController)
application.register("stream", StreamController)
application.register("mobile", MobileMenuController)
application.register("back", BackController)