import React from "react"
import PropTypes from "prop-types"
class Dashboard extends React.Component {

 componentDidMount() {
     console.log(this.props);
 }

  render () {
    const { user } = this.props;
    return (
      <React.Fragment>
        <section className="section-padding-sm-2 blue-bg">
        <div className="container">
            <div className="row">
                <div className="col-xl-4 col-lg-4 col-md-6 col-sm-6 mb-20">
                    <div className="card">
                        <div className="card-header">
                              Profile <a href="profile.html"><i className="ti-arrow-top-right"></i></a>
                        </div>
                        <div className="card-body">
                            <p>Good Morning! <strong>{user.fullName}</strong></p>
                            <p>Customer id: <strong>236585</strong>; Last login: <strong>{user.lastLogin}</strong></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section>
      </React.Fragment>
    );
  }
}

Dashboard.propTypes = {
  user: PropTypes.object.isRequired,
}

export default Dashboard
