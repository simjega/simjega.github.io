import './App.css'

// Import styles
import Resume from './assets/jgokhale_resume.pdf'

function App() {
  return (
    <iframe src={Resume} width="100%" height="100%" style={{border: "none", top: 0, left: 0, position: "absolute"}}></iframe>
  );
}

export default App;
