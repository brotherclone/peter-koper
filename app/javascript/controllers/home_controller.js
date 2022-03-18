import { Controller } from "@hotwired/stimulus"
import imageLoading from "../packs/image-loading";

export default class extends Controller {

    static tags = []

    connect() {
        imageLoading();
    }
}