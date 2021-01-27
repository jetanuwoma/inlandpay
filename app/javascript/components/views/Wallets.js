import React from "react"
import PropTypes from "prop-types"
import Card from "../common/Card";


class Wallets extends React.Component {

  componentDidMount() {
    console.log(this.props);
  }

  render () {
    const { user, wallet } = this.props;
    return (
      <React.Fragment>
        <section className="section-padding-sm-2 blue-bg">
          <div className="container">
            <div className="row">
                <Card
                  key={wallet.code}
                  name={wallet.name}
                  balance={wallet.balance}
                  code={wallet.code}
                />
            </div>
          </div>
        </section>
        <section className="section-padding-sm-2 blue-bg-2">
          <div className="container">
            <div className="row justify-content-center">
              <div className="col-xl-3 col-lg-3 col-md-6 col-sm-6 mb-20">
                <div className="card mb-30">
                  <div className="card-header">
                    {wallet.code === 'BTC' && (
                      <span>Buy</span>
                    )}
                    {wallet.code !== 'BTC' && (
                      <span>Deposit</span>
                    )}
                  </div>
                  <div className="card-body">

                    <a href="" className="bttn-small btn-fill"><i className="ti-user"></i>Deposit</a>
                  </div>
                </div>
                <div className="card mb-30">
                  <div className="card-header">
                    Withdraw
                  </div>
                  <div className="card-body">
                    <p>Withdraw your wallet balance directly to your bank account</p>
                    <a href="" className="bttn-small btn-fill"><i className="ti-arrow-down"></i>Withdraw</a>
                  </div>
                </div>
                <div className="card">
                  <div className="card-header">
                    Convert
                  </div>
                  <div className="card-body">
                    <p>Convert your {wallet.name} to other currency</p>
                    <a href="" className="bttn-small btn-fill"><i className="ti-direction"></i> Convert</a>
                  </div>
                </div>
              </div>
              <div className="col-xl-9 col-lg-9 col-md-12 mb-20">
                <div className="transaction-list table-responsive">
                  <table className="table table-hover">
                    <thead>
                    <tr>
                      <th scope="col">Date</th>
                      <th scope="col">Description</th>
                      <th scope="col">Amount</th>
                      <th scope="col">Status</th>
                      <th scope="col">Bank or Card</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr data-toggle="modal" data-target="#exampleModalCenter">
                      <td><span>15 March, 2020</span></td>
                      <td><strong>Padlock Holdings Bank Corp</strong> <span>- Widthdraw</span></td>
                      <td><strong>- $589.20</strong></td>
                      <td><i className="ti-check cl-primary" data-toggle="tooltip" data-placement="top" title=""
                             data-original-title="Finished"></i></td>
                      <td><strong className="cl-primary">USD XXXX-2359</strong></td>
                    </tr>
                    </tbody>
                  </table>

                </div>
              </div>
            </div>
          </div>
        </section>
      </React.Fragment>
    );
  }
}

Wallets.propTypes = {
  user: PropTypes.object.isRequired,
  wallet: PropTypes.objectOf({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    balance: PropTypes.number.isRequired,
    code: PropTypes.string.isRequired
  })
}

export default Wallets
