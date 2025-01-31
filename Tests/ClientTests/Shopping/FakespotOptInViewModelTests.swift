// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import XCTest
import Shared
import Common
@testable import Client

final class FakespotOptInCardViewModelTests: XCTestCase {
    private var viewModel: FakespotOptInCardViewModel!
    private var mockProfile: MockProfile!

    override func setUp() {
        super.setUp()
        DependencyHelperMock().bootstrapDependencies()
        mockProfile = MockProfile()
        viewModel = FakespotOptInCardViewModel()
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
        mockProfile = nil
    }

    func testGetWebsites() {
        viewModel.productSitename = "bestbuy"
        var websites = viewModel.orderWebsites
        XCTAssertEqual(websites[0], FakespotOptInCardViewModel.PartnerWebsite.bestbuy.title)

        viewModel.productSitename = "amazon"
        websites = viewModel.orderWebsites
        XCTAssertEqual(websites[0], FakespotOptInCardViewModel.PartnerWebsite.amazon.title)

        viewModel.productSitename = "walmart"
        websites = viewModel.orderWebsites
        XCTAssertEqual(websites[0], FakespotOptInCardViewModel.PartnerWebsite.walmart.title)

        viewModel.productSitename = "randomShop"
        websites = viewModel.orderWebsites
        XCTAssertEqual(websites[0], FakespotOptInCardViewModel.PartnerWebsite.amazon.title) // as "Amazon" is the default
    }
}
