import React from "react"
import PropTypes from "prop-types"
import Card from "../common/Card";


class Dashboard extends React.Component {

 componentDidMount() {
     console.log(this.props);
 }

  render () {
    const { user, wallets } = this.props;
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
              {wallets.map((item) => (
                <div
                  className="col-xl-4 col-lg-4 col-md-6 col-sm-6"
                  key={item.code}
                >
                  <div className="single-jackpot">
                    <a href={`/wallets/${item.code}`}>
                        <div className="content">
                          <div className="name">{item.name}</div>
                          <div className="price-play">{item.symbol}{item.balance} <span><i className="fa fa-play"></i></span></div>
                          <div className="mrp">{item.code}</div>
                          <span className="bttn-small btn-fill w-100">Open</span>
                        </div>
                    </a>
                  </div>
                </div>
              ))}
            </div>
        </div>
        </section>
      </React.Fragment>
    );
  }
}

Dashboard.propTypes = {
  user: PropTypes.object.isRequired,
  wallets: PropTypes.arrayOf({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    balance: PropTypes.number.isRequired,
    code: PropTypes.string.isRequired,
    symbol: PropTypes.string.isRequired,
  })
}

export default Dashboard
