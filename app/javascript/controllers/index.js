import { application } from "./application"


import MediaModalController from "./media_modal_controller"
import StreamController from "./stream_controller"
import HomeController from "./home_controller"
import MobileMenuController from "./mobile_menu_controller"

application.register("home", HomeController)
application.register("media", MediaModalController)
application.register("stream", StreamController)
application.register("mobile", MobileMenuController)
