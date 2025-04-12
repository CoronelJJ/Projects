/* import styles from "./page.global.css"; */


import { FaTableTennis } from "react-icons/fa";
import Accordian from "./Components/accordian";
import ImageSlider from "./Components/image-slider";
import LightDarkMode from "./Components/light-dark-mode";
import LoadMoreData from "./Components/load-more-data";
import QrCodeGenerator from "./Components/qr-generator";
import RandomColor from "./Components/random-color";
import ScrollIndicator from "./Components/Scroll-indicator";
import StarRating from "./Components/star-rating";
import TreeView from "./Components/tree-view";
import menus from "./Components/tree-view/data";
import TabTest from "./Components/custom-tabs/tab-test";
import ModalTest from "./Components/custom-modal-popup/modal-test";
import GithubProfileFinder from "./Components/github-profile-finder";
import SearchAutoComplete from "./Components/search-auto-complete";
import TicTacToe from "./Components/tec-tac-toe";
import FeaturedFlags from "./Components/feature-flag";
import FeaturedFagGlobalState, {
  FeatureFlagsContext,
} from "./Components/feature-flag/context";
import UseFetchHookTest from "./Components/use-fetch/test";
import OutsideClickHookTest from "./Components/use-outside-click/test";
import UseWindowResizeTest from "./Components/use-window-resize/test";
import ScrollTopBottom from "./Components/scroll-top-bottom";
import ScrollToSection from "./Components/scroll-top-bottom/scroll-to-section";
import Weather from "./Components/weather-app/weather";

export default function Home() {
  return (
    <div>
      {/*Accordian component*/}
      {/* <Accordian/> */}
      {/*Random Color component*/}
      {/* <RandomColor/> */}
      {/*Star rating component*/}
      {/* <StarRating maxStars={10}/> */}
      {/*Image slider component */}
      {/*<ImageSlider url={'https://picsum.photos/v2/list'} page={'1'} limit={'10'}/>*/}
      {/*Load more data component*/}
      {/* <LoadMoreData/> */}
      {/*Treeview component */}
      {/* <TreeView menus={menus}/> */}
      {/*QR code generator component */}
      {/* <QrCodeGenerator/> */}
      {/*Light/Dark theme switch */}
      {/* <LightDarkMode/> */}
      {/* Scroll bar indicator */}
      {/* <ScrollIndicator url={"https://dummyjson.com/products?limit=100"}/> */}
      {/* Custom tabs component */}
      {/* <TabTest/> */}
      {/* Custom modal popup component*/}
      {/* <ModalTest/> */}
      {/* Github profile finder component */}
      {/* <GithubProfileFinder/> */}
      {/* Search auto complete component */}
      {/* <SearchAutoComplete/> */}
      {/* Tic tac toe component */}
      {/*  <TicTacToe/> */}
      {/* Featured Flags */}
      {/* <FeaturedFagGlobalState>
        <FeaturedFlags />
      </FeaturedFagGlobalState> */}
      {/* UseFetch custom hook */}
      {/* <UseFetchHookTest/> */}
      {/* UseClickOutside custom hook */}
      {/* <OutsideClickHookTest/> */}
      {/* UseWindowResize custom hook */}
      {/* <UseWindowResizeTest/> */}
      {/* Scroll top bottom feature */}
      {/* <ScrollTopBottom/> */}
      {/* Scroll to section feature */}
      {/* <ScrollToSection/> */}
      {/* Weather app */}
      {/* <Weather/> */}
      {/* Food recipe app */}
      
      
    </div>
  );
}
