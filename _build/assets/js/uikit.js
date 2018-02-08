/* import core */
import UIkit from 'uikit/src/js/api/index';
import mixin from 'uikit/src/js/mixin/index';
import boot from 'uikit/src/js/api/boot';

/* import core components */
import Accordion from 'uikit/src/js/core/accordion';
import Alert from 'uikit/src/js/core/alert';
import Core from 'uikit/src/js/core/core';
import Cover from 'uikit/src/js/core/cover';
// import Drop from 'uikit/src/js/core/drop';
// import Dropdown from 'uikit/src/js/core/dropdown';
import FormCustom from 'uikit/src/js/core/form-custom';
import Gif from 'uikit/src/js/core/gif';
import Grid from 'uikit/src/js/core/grid';
import HeightMatch from 'uikit/src/js/core/height-match';
import HeightViewport from 'uikit/src/js/core/height-viewport';
import Icon from 'uikit/src/js/core/icon';
import Leader from 'uikit/src/js/core/leader';
import Margin from 'uikit/src/js/core/margin';
import Modal from 'uikit/src/js/core/modal';
// import Nav from 'uikit/src/js/core/nav';
// import Navbar from 'uikit/src/js/core/navbar';
// import Offcanvas from 'uikit/src/js/core/offcanvas';
import Responsive from 'uikit/src/js/core/responsive';
import Scroll from 'uikit/src/js/core/scroll';
import Scrollspy from 'uikit/src/js/core/scrollspy';
// import ScrollspyNav from 'uikit/src/js/core/scrollspy-nav';
import Sticky from 'uikit/src/js/core/sticky';
import Svg from 'uikit/src/js/core/svg';
import Switcher from 'uikit/src/js/core/switcher';
import Tab from 'uikit/src/js/core/tab';
import Toggle from 'uikit/src/js/core/toggle';
import Video from 'uikit/src/js/core/video';

/* import components */
import Countdown from 'uikit/src/js/components/countdown';
// import GridParallax from 'uikit/src/js/components/grid-parallax';
import Lightbox from 'uikit/src/js/components/lightbox';
import Notification from 'uikit/src/js/components/notification';
// import Parallax from 'uikit/src/js/components/parallax';
import Slider from 'uikit/src/js/components/slider';
import Slideshow from 'uikit/src/js/components/slideshow';
// import Sortable from 'uikit/src/js/components/sortable';
import Tooltip from 'uikit/src/js/components/tooltip';
// import Upload from 'uikit/src/js/components/upload';
import Icons from 'uikit/dist/js/uikit-icons';

/* load uikit */
UIkit.version = VERSION;
mixin(UIkit);
boot(UIkit);
// core functionality
UIkit.use(Core);

/* enable core components */
if(typeof Toggle != 'undefined') UIkit.use(Toggle);
if(typeof Accordion != 'undefined') UIkit.use(Accordion);
if(typeof Alert != 'undefined') UIkit.use(Alert);
if(typeof Video != 'undefined') UIkit.use(Video);
if(typeof Cover != 'undefined') UIkit.use(Cover);
if(typeof Drop != 'undefined') UIkit.use(Drop);
if(typeof Dropdown != 'undefined') UIkit.use(Dropdown);
if(typeof FormCustom != 'undefined') UIkit.use(FormCustom);
if(typeof HeightMatch != 'undefined') UIkit.use(HeightMatch);
if(typeof HeightViewport != 'undefined') UIkit.use(HeightViewport);
if(typeof Margin != 'undefined') UIkit.use(Margin);
if(typeof Gif != 'undefined') UIkit.use(Gif);
if(typeof Grid != 'undefined') UIkit.use(Grid);
if(typeof Leader != 'undefined') UIkit.use(Leader);
if(typeof Modal != 'undefined') UIkit.use(Modal);
if(typeof Nav != 'undefined') UIkit.use(Nav);
if(typeof Navbar != 'undefined') UIkit.use(Navbar);
if(typeof Offcanvas != 'undefined') UIkit.use(Offcanvas);
if(typeof Responsive != 'undefined') UIkit.use(Responsive);
if(typeof Scroll != 'undefined') UIkit.use(Scroll);
if(typeof Scrollspy != 'undefined') UIkit.use(Scrollspy);
if(typeof ScrollspyNav != 'undefined') UIkit.use(ScrollspyNav);
if(typeof Sticky != 'undefined') UIkit.use(Sticky);
if(typeof Svg != 'undefined') UIkit.use(Svg);
if(typeof Icon != 'undefined') UIkit.use(Icon);
if(typeof Switcher != 'undefined') UIkit.use(Switcher);
if(typeof Tab != 'undefined') UIkit.use(Tab);

/* enable components */
if(typeof Countdown != 'undefined') UIkit.use(Countdown);
if(typeof GridParallax != 'undefined') UIkit.use(GridParallax);
if(typeof Lightbox != 'undefined') UIkit.use(Lightbox);
if(typeof Notification != 'undefined') UIkit.use(Notification);
if(typeof Parallax != 'undefined') UIkit.use(Parallax);
if(typeof Slider != 'undefined') UIkit.use(Slider);
if(typeof Slideshow != 'undefined') UIkit.use(Slideshow);
if(typeof Sortable != 'undefined') UIkit.use(Sortable);
if(typeof Tooltip != 'undefined') UIkit.use(Tooltip);
if(typeof Upload != 'undefined') UIkit.use(Upload);
if(typeof Icons != 'undefined') UIkit.use(Icons);

export default UIkit;